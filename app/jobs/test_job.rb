class TestJob < ActiveJob::Base
  queue_as :default

  def perform(msg)
    puts "here lies dragons #{msgs}"
  end
end
