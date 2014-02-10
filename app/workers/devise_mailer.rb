class DeviseMailer

  include Sidekiq::Worker

  def self.confirmation_instructions(record, opts = {})
    new(:confirmation_instructions, record, opts)
  end

  def self.reset_password_instructions(record, opts = {})
    new(:reset_password_instructions, record, opts)
  end

  def self.unlock_instructions(record, opts = {})
    new(:unlock_instructions, record, opts)
  end

  def initialize(method, record, opts = {})
    @method, @record, @opts = method, record, opts
  end

  def perform(name, count)
    # You need to hardcode the class of the Devise mailer that you
    # actually want to use. The default is Devise::Mailer.
    Devise::Mailer.delay.send(@method, @record, @opts)
  end

end