require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  #   driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  #   driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: { args: ["headless", "no-sandbox", "disable-dev-shm-usage"] }
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
