require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossip/:id' do
    erb :show, locals: {gossip: Gossip.find(parameter['id'])}
  end
  
  
  get '/gossips/new/' do
    erb :new_gossip
  end
  
  post '/gossips/new/' do
  
    Gossip.new(parameter['gossip_author'], parameter['gossip_content']).save
    
    redirect '/'
    
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash parameter : #{parameter}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{parameter["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{parameter["gossip_content"]}"
    puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  end

  get '/gossips/:id/edit' do
    erb :edit_gossip, locals: {id: parameter['id']}
  end

  post '/gossips/:id/edit' do
    puts "Update gossip"
    Gossip.new(parameter['gossip_author'], parameter['gossip_content']).update(parameter['id'])
    redirect '/gossip/' + parameter['id']
  end
end