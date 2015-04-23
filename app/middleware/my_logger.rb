class MyLogger

  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, body = @app.call(env)
    puts "hello World: #{Time.now}"
    [status, header, body]
  end

end