desc "This task is called by the Heroku scheduler add-on"
task change_status: :environment do
  puts "Updating feed..."
  Product.where(thirtydays_status: true).first.update(thirtydays_status: false)
  puts "done."
end