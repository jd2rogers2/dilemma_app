make dilemmas viewable by all users
 - change dilemma#show to take in id
 - change all links to show to pass in dilemma's id
 - remove all edit links unless current_user == dilemma.user

adding comments
comments model and migration content:text user_id:integer dilemma_id:integer
belongs_to :user


