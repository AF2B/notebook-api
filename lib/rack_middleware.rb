class AppName::RackMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    # if original_path is equal '/', must return the original path, but
    # if not equal '/', must return a name of the application on Header
    # 'Access-Control-Allow-Origin'
    if env['PATH_INFO'] == '/'
      [200, { 'Content-Type' => 'text/html' }, [@app.call(env)]]
    else
      [200, { 'Content-Type' => 'text/html', 'Access-Control-Allow-Origin' => 'resttesttest.com' }, [@app.call(env)]]
    end
  end
end
