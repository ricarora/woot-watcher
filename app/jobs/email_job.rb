class EmailJob
  @queue = :email

  def self.perform
    RequestMailer.check_request.deliver
  end
end
