require 'open-uri'
require 'json'

class Parsing

 def self.token_creation
  url = "https://opentdb.com/api_token.php?command=request"
  # token_page = JSON.parse(open(url).read)
  # token_page["token"]
  "fa019cb3da8bcce8780c1d51b38e4cffa548fbf12dea83a0a2034f7ffd1a2441"
 end

 def self.new_question_creation(id, token)
  url ="https://opentdb.com/api.php?amount=1&category=#{id}&token=#{token}"
  JSON.parse(open(url).read)
  # {
  #   "response_code"=>0,
  #   "results"=>[{
  #     "category"=>"Vehicles",
  #     "type"=>"multiple",
  #     "difficulty"=>"hard",
  #     "question"=>"In 2014, over 6 million General Motors vehicles were recalled due to what critical flaw?",
  #     "correct_answer"=>"Faulty ignition switch",
  #     "incorrect_answers"=>["Malfunctioning gas pedal", "Breaking fuel lines", "Faulty brake pads"]}]}
 end
end
