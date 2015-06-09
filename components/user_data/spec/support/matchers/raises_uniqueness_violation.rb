def raise_uniqueness_violation
  raise_exception ActiveRecord::RecordInvalid, /Name has already been taken/
end