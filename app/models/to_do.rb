require 'time'
class ToDo < ApplicationRecord
  def as_json(options={})
    {
        id: id,
        owner: owner,
        content: content,
        valide: valide,
        date_creation: created_at.rfc2822,
        date_modification: updated_at.rfc2822
    }.as_json(options)
  end
end
