class Post < ApplicationRecord

  after_create :test_sidekiq

  def test_sidekiq
    TestWorker.perform_async('testing sidekiq', 5)
  end
end
