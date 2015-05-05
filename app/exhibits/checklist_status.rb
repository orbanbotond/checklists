class ChecklistStatus < DisplayCase::Exhibit
  def self.applicable_to?(object, _context)
    object.class.name == 'Checklist'
  end

  def task_status
    if tasks.pending.count > 0
      "#{tasks.pending.count} of #{tasks.count} pending"
    else
      'Complete'
    end
  end
end
