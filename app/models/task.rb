class Task < ApplicationRecord
  enum status: { unfinished: 0, finished: 1 }
end
