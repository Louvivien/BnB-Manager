namespace :twitter_bnb do
  desc "bot twitter Bnbmanager def frenchriviera"
  task twitter_bnb: :environment do
     puts "Début de mon programme"
     TwitterBnb.new.cotedazur
     puts "Le programme a tourné"
  end
end
