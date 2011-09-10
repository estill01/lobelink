# DEV NOTES #

---
# DESIGN #
## GENERAL ##
		* add subtle ivy vines wrapping around elements and the background throughout
			** small leaves, organic looking
			** this will be hard to do well, but could add distinaaction and a feeling of 'authoritativeness'
			** U Chicago-esque

## NAV BAR ##
		* reduce height of nav

## LANDER ##
		* the main form needs work
			** align the form elements
			** lighten up the shadows?
			** possibly narrow the fields; make more room for 'responsive' content to the left and right
			** make the input fields more interesting
			** add share toggles to the right of the 'Post' button 
				*** Twitter, Fb, etc (but keep it classy!) 
			** add 'identity mask' toggle to post anonymously
			** make the form protrude instead of inset?
				*** then I could make the fields inset (as a 3-part whole) and slide down effect going into the feed might feel more natural

## USER PROFILE ##
		* make the top more useful/better 
		* disassociate the _user_info partial from the profile view user info data 
			> 1) 'anywhere' dogtag of user data
			> 2) 'anywhere' dogtag of user recent policy
			> 3) user profile view account/user overview

---
# FEATURES #
## GENERAL ##
	* Hook lander page form up to current_user
		** the profile url ought to be the user id (ideal? security/privacy issue?)
		** do not redirect; let users hang out on the lander and make more policies
		** use a cookie comparison to offer users option to merge policies they create when not logged in with their official record if they do log in
			*** if user has cookies turned off, flash a :notice telling them they're at risk of losing attribution for their policies
		** add error notice area/functionality to the lander form
			*** overlay on the fields? 
	* update nav to replace 'log out' with user avatar
		** click to go to profile; will help navigation for anonymous users

	* Agree/Disagree buttons on each policy
		** add these to user profile
	* Comments on Policies
	* Generate short URL for each policy so people can share them around and such
		** also, if go for private policies, then can be used for private group policy conversations
		*** should give option to use .htaccess controls on private policies

## ACCOUNTS ##
		* password recovery
		* email verification
			** i.e. send the email with a link and such

## USABILITY ##
		* add in the HTML5 Boilerplate cross-browser normalization stylesheets
		* each policy should have a unique url
		* Get CarrierWave going to do the image resizes

---
# LEXICON #
	* Agree/Disagree with a Policy
	* Monitor/Dismiss an Issues
		** get added to your profile

---
# RUMINATIONS #

situaiton
plan

issue
policy


policy:plan :: issue:situation
prediction

---
# DATA MODEL

:user has_many :policies, :through => :positions
:user has_many :issues, :through => :monitor

:policy belongs_to  :user
:policy belongs_to :issue

:issue has_many :policies
:issue has_many :users, :through => :monitors
	via the Monitoring functionality; the issue gets added to the monitoring user's list of issues
		rename concern => issue, add a Monitors table {id, user_id, issue_id}

:user has_many :votes, :polymorphic => true
Agree/Disagree => Opinions
Monitor/Dismiss => Priorities

(vote with your feet/clicks)

---
user
|
issue
	accepts_nested_resources_for :user
|
policy
	accepts_nested_resources_for [:issue, :user]


this way creating a policy will also create an issue and a user
	then can go back in and try and merge them appropriately
		i.e. if the user signs in/up, associate the policies/issues they've made to the new user_id 


user
	has_many :issues
	has_many :policies, :through => :issue

issue
	belongs_to :user
	has_many :policies

policy
	belongs_to :issue
	belongs_to :user, :through => :issue


