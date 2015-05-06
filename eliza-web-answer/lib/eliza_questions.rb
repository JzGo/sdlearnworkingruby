require_relative 'response'

Response.add_response ['dog', 'cat', 'bird'], 'Do you like animals?', 'What about other animals?'
Response.add_response ['mom', 'mother', 'dad', 'brother', 'sister'], 'Tell me more about your mother.', 'Tell me more about your family.'
Response.add_response ['hurt', 'pain', 'worry'], 'How has your health been?'

Response.add_dummies ['Tell me more.'], "That's interesting.", 'Go on.'
