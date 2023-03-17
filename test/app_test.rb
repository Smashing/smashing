require 'test_helper'
require 'haml'

class AppTest < Dashing::Test
  def setup
    @connection = []
    # stop sinatra from handling Hash value specially which makes it merge new value into previous one
    app.settings.connections = nil
    app.settings.connections = {@connection => ['some_widget']}
    app.settings.auth_token = nil
    app.settings.default_dashboard = nil
    app.settings.history_file = File.join(Dir.tmpdir, 'history.yml')
    app.settings.history = nil
    app.settings.history = {}
  end

  def test_redirect_to_first_dashboard
    with_generated_project do
      get '/'
      assert_equal 302, last_response.status
      assert_equal 'http://example.org/sample', last_response.location
    end
  end

  def test_redirect_to_first_dashboard_without_erb
    with_generated_project do |dir|
      FileUtils.touch(File.join(dir, "dashboards/htmltest.html"))
      get '/'
      assert_equal 302, last_response.status
      assert_equal 'http://example.org/htmltest', last_response.location
    end
  end

  def test_redirect_to_default_dashboard
    with_generated_project do
      app.settings.default_dashboard = 'test1'
      get '/'
      assert_equal 302, last_response.status
      assert_equal 'http://example.org/test1', last_response.location
    end
  end

  def test_errors_out_when_no_dashboards_available
    with_generated_project do
      app.settings.views = File.join(app.settings.root, 'lib')

      get '/'
      assert_equal 500, last_response.status
    end
  end

  def test_post_widgets_without_auth_token
    post '/widgets/some_widget', JSON.generate({value: 6})
    assert_equal 204, last_response.status

    assert_equal 1, @connection.length
    data = parse_data @connection[0]
    assert_equal 6, data['value']
    assert_equal 'some_widget', data['id']
    assert data['updatedAt']
  end

  def test_post_widgets_with_invalid_auth_token
    app.settings.auth_token = 'sekrit'
    post '/widgets/some_widget', JSON.generate({value: 9})
    assert_equal 401, last_response.status
  end

  def test_post_widgets_with_valid_auth_token
    app.settings.auth_token = 'sekrit'
    post '/widgets/some_widget', JSON.generate({value: 9, auth_token: 'sekrit'})
    assert_equal 204, last_response.status
  end

  def test_get_events
    post '/widgets/some_widget', JSON.generate({value: 8})
    assert_equal 204, last_response.status

    get '/events'
    assert_equal 200, last_response.status
    assert_equal 8, parse_data(@connection[0])['value']
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def test_get_events_by_id
    with_generated_project do
      post '/widgets/synergy', JSON.generate({ value: 3 })
      assert_equal 204, last_response.status

      post '/widgets/valuation', JSON.generate({ value: 'a' })
      assert_equal 204, last_response.status

      get '/events?ids=synergy%2Cvaluation'
      assert_equal 200, last_response.status

      events = last_response.body.split(/\n+/) # two events, printed with blank lines separating them
      assert_equal 2, events.length

      assert_equal ['synergy', 3], parse_data(events[0]).values_at('id', 'value')
      assert_equal %w[valuation a], parse_data(events[1]).values_at('id', 'value')
    end
  end

  def test_get_events_by_unknown_id
    with_generated_project do
      post '/widgets/synergy', JSON.generate({ value: 3 })
      assert_equal 204, last_response.status

      get '/events?ids=unknown'
      assert_equal 200, last_response.status
      assert_equal '', last_response.body
    end
  end

  def test_get_events_without_filter
    with_generated_project do
      post '/widgets/foobar', JSON.generate({ value: 'x' })
      assert_equal 204, last_response.status

      get '/events'
      assert_equal 200, last_response.status

      events = last_response.body.split(/\n+/)
      assert_equal 1, events.length

      assert_equal ['foobar', 'x'], parse_data(events[0]).values_at('id', 'value')
    end
  end

  def test_dashboard_events
    post '/dashboards/my_super_sweet_dashboard', JSON.generate({event: 'reload'})
    assert_equal 204, last_response.status

    get '/events'
    assert_equal 200, last_response.status
    assert_equal 'dashboards', parse_event(@connection[0])
    assert_equal 'reload', parse_data(@connection[0])['event']
  end

  def test_get_dashboard
    with_generated_project do
      get '/sampletv'
      assert_equal 200, last_response.status
      assert_includes last_response.body, 'class="grid"'
      assert_includes last_response.body, "DOCTYPE"
    end
  end

  def test_page_title_set_correctly
    with_generated_project do
      get '/sampletv'
      assert_includes last_response.body, '<title>1080p dashboard</title>'
    end
  end

  def test_get_haml_dashboard
    app.template_languages << :haml

    with_generated_project do |dir|
      File.write(File.join(dir, 'dashboards/hamltest.haml'), '.gridster')
      get '/hamltest'
      assert_equal 200, last_response.status
      assert_includes last_response.body, "class='gridster'"
    end
  end

  def test_get_haml_widget
    app.template_languages << :haml

    with_generated_project do |dir|
      File.write(File.join(dir, 'widgets/clock/clock.haml'), '%h1 haml')
      File.unlink(File.join(dir, 'widgets/clock/clock.html'))
      get '/views/clock.html'
      assert_equal 200, last_response.status
      assert_includes last_response.body, '<h1>haml</h1>'
    end
  end

  def test_get_nonexistent_dashboard
    with_generated_project do
      get '/nodashboard'
      assert_equal 404, last_response.status
    end
  end

  def test_get_widget
    with_generated_project do
      get '/views/meter.html'
      assert_equal 200, last_response.status
      assert_includes last_response.body, 'class="meter"'
    end
  end

  def test_get_nonexistent_widget
    with_generated_project do
      get '/views/nowidget.html'
      assert_equal 200, last_response.status
      assert_equal last_response.body, 'Drats! Unable to find a widget file named: nowidget to render.'
    end
  end

  def test_get_xss_widget
    with_generated_project do
      get CGI.escape('/views/nowidget-<h1>.html')
      assert_equal 200, last_response.status
      assert_equal last_response.body, 'Drats! Unable to find a widget file named: nowidget-&lt;h1&gt; to render.'
    end
  end

  def with_generated_project
    source_path = File.expand_path('../../templates', __FILE__)

    temp do |dir|
      cli = Dashing::CLI.new
      cli.stubs(:source_paths).returns([source_path])
      silent { cli.new 'new_project' }

      app.settings.public_folder = File.join(dir, 'new_project/public')
      app.settings.views = File.join(dir, 'new_project/dashboards')
      app.settings.root = File.join(dir, 'new_project')

      app.settings.raise_errors = true
      app.settings.dump_errors = false
      app.settings.show_exceptions = false

      yield app.settings.root
    end
  end

  def app
    Sinatra::Application
  end

  def parse_data(string)
    JSON.parse string[/data: (.+)/, 1]
  end

  def parse_event(string)
    string[/event: (.+)/, 1]
  end
end
