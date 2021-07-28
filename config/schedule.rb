every 1.hour do
  runner "ScheduleWalkRemindersJob.perform_now"
end
