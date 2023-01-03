require_relative './app'

def main
  app = App.new
  app.select_option
  at_exit { app.save_data }
end

main
