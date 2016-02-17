class StartupMailerPreview < ActionMailer::Preview
  def startup_approved
    StartupMailer.startup_approved(Startup.first)
  end

  def feedback_as_email
    startup_feedback = StartupFeedback.first
    StartupMailer.feedback_as_email(startup_feedback)
  end

  def connect_request_confirmed
    connect_slot = ConnectSlot.new(
      faculty: Faculty.first,
      slot_at: 4.days.from_now
    )

    connect_request = ConnectRequest.new(
      connect_slot: connect_slot,
      startup: Startup.first,
      questions: "Question 1) This is question 1.\nQuestion 2) This is question 2.\n",
      status: ConnectRequest::STATUS_CONFIRMED,
      meeting_link: 'https://google-hangouts.com/some_link'
    )

    StartupMailer.connect_request_confirmed(connect_request)
  end
end
