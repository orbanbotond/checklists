module ChecklistHelper
  def task_status(checklist)
    if checklist.tasks.pending.count > 0
      "#{checklist.tasks.pending.count} of #{checklist.tasks.count} pending"
    else
      "Complete"
    end
  end
end
