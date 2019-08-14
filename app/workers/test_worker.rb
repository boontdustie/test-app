class TestWorker
  include Sidekiq::Worker

  def perform(*args)
    puts args
    # Do something
  end
end
