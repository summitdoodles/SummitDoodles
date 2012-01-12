#db:populate to run
namespace :db do
  desc "Fill database with test data"
  task :populate => :environment do
	Rake::Task['db:reset'].invoke
	
	breedGR=Breed.create!(:name => "Golden Retriever")
	breedP=Breed.create!(:name => "Poodle")
	
	genderM=Gender.create!(:gender => "Male")
	genderF=Gender.create!(:gender => "Female")
	genderU=Gender.create!(:gender => "Unknown")
	
  	colorG=Color.create!(:color => "Gold")
  	colorB=Color.create!(:color => "Black")

	stateKS=State.create!(:name => "Kansas",
					:short_name => "KS")
	stateCA=State.create!(:name => "California",
					:short_name => "CA")
	
	sireS=Sire.create!(:name=>"Sam",
				   :birthday=>"01/05/2000",
				   :active=>true,
				   :breed_id=>breedP.id)
	sireM=Sire.create!(:name=>"Max",
				   :birthday=>"05/05/2004",
				   :active=>true,
				   :breed_id=>breedP.id)
	
	dameD=Dame.create!(:name=>"Dax",
				   :birthday=>"01/05/1985",
				   :active=>false,
				   :breed_id=>breedGR.id)
	dameB=Dame.create!(:name=>"Bess",
				   :birthday=>"09/05/2004",
				   :active=>true,
				   :breed_id=>breedGR.id)

	HeatCycle.create!(:date => "09/05/2004",
					  :dame_id => dameD.id,
					  :in_heat => "Yes" )
	HeatCycle.create!(:date => "08/05/2000",
					  :dame_id => dameD.id,
					  :in_heat => "No" )
	HeatCycle.create!(:date => "07/05/2005",
					  :dame_id => dameD.id,
					  :in_heat => "Maybe" )
	HeatCycle.create!(:date => "06/05/2004",
					  :dame_id => dameD.id,
					  :in_heat => "Yes" )
	HeatCycle.create!(:date => "01/05/2009",
					  :dame_id => dameB.id,
					  :in_heat => "Yes" )

  	litter1=Litter.create!(:birthday=>"01/05/2009",
						   :sire_id=>sireS.id,
						   :dame_id=>dameB.id )
	litter2=Litter.create!(:birthday=>"02/02/2008",
						   :sire_id=>sireS.id,
						   :dame_id=>dameD.id )
	litter3=Litter.create!(:birthday=>"01/05/2009",
						   :sire_id=>sireM.id,
						   :dame_id=>dameD.id )
	
	email_priorityN=EmailPriority.create!(:name=>"Normal")
	email_priorityH=EmailPriority.create!(:name=>"High")
	email_priorityL=EmailPriority.create!(:name=>"Low")	
	
	client1=Client.create!(:first_name=>"FirstName1",
				   :last_name=>"lastname1",
				   :address_1=>"101 here street",
				   :address_2=>"apmt 1",
				   :city=>"thisCity",
				   :state_id=>stateKS.id,
				   :zip=>"64034",
				   :email=>"email@here.com",
				   :phone_number=>"987-987-9878",
				   :secondary_phone_number=>"654-987-3215",
				   :gender_id=>genderM.id,
				   :will_be_referal=>false,
				   :reference=>"",
				   :email_priority_id=>email_priorityN.id,
				   #:do_not_email=>true,
				   :notes=>"Note" )
	client2=Client.create!(:first_name=>"FirstName2",
				   :last_name=>"lastname2",
				   :address_1=>"102 here street",
				   :address_2=>"apmt 2",
				   :city=>"thisCity",
				   :state_id=>stateKS.id,
				   :zip=>"64034",
				   :email=>"email2@here.com",
				   :phone_number=>"987-987-9878",
				   #:secondary_phone_number=>"654-987-3215",
				   :gender_id=>genderF.id,
				   :will_be_referal=>false,
				   :email_priority_id=>email_priorityH.id,
				   #:do_not_email=>true,
				   :reference=>"",
				   :notes=>"Note" )
	client3=Client.create!(:first_name=>"FirstName3",
				   :last_name=>"lastname3",
				   :address_1=>"103 here street",
				   :address_2=>"apmt 3",
				   :city=>"thisCity3",
				   :state_id=>stateKS.id,
				   :zip=>"64033",
				   :email=>"email3@here.com",
				   :phone_number=>"987-987-9878",
				   #:secondary_phone_number=>"654-987-3215",
				   :gender_id=>genderF.id,
				   :will_be_referal=>true,
				   :reference=>"They are good . . .",
				   :email_priority_id=>email_priorityL.id,
				   #:do_not_email=>true,
				   :notes=>"Note asdf asdf asd f" )
	client4=Client.create!(:first_name=>"FirstName4",
				   :last_name=>"last name 4",
				   :address_1=>"104 here street",
				   :address_2=>"apmt 4",
				   :city=>"thisCity4",
				   :state_id=>stateKS.id,
				   :zip=>"64444",
				   :email=>"email4@here.com",
				   :phone_number=>"987-987-9878",
				   #:secondary_phone_number=>"654-987-3215",
				   :gender_id=>genderF.id,
				   :will_be_referal=>false,
				   :reference=>"",
				   :email_priority_id=>email_priorityN.id,
				   :do_not_email=>true,
				   :notes=>"Note4" )
	client5=Client.create!(:first_name=>"FirstName5",
				   :last_name=>"last name 5",
				   :address_1=>"105 here street",
				   :address_2=>"apmt 5",
				   :city=>"thisCity5",
				   :state_id=>stateCA.id,
				   :zip=>"64454",
				   :email=>"email5@here.com",
				   :phone_number=>"987-987-9878",
				   #:secondary_phone_number=>"654-987-3215",
				   :gender_id=>genderF.id,
				   :will_be_referal=>false,
				   :reference=>"",
				   :email_priority_id=>email_priorityN.id,
				   #:do_not_email=>true,
				   :notes=>"Note5" )
	#empty clients (example of leads from single email or phone call)
	Client.create!(:first_name=>"Tim",
				   :last_name=>"Bob",
				   #:email=>"email333@here.com",
				   :email_priority_id=>email_priorityN.id,
				   #:do_not_email=>true,
				   :phone_number=>"987-987-9878" )
	Client.create!(:first_name=>"Bill",
				   :last_name=>"Bobby",
				   :email=>"email333@here.com",
				   :email_priority_id=>email_priorityN.id,
				   #:do_not_email=>true,
				   :phone_number=>"987-987-9878" )
	Client.create!(:first_name=>"Sam",
				   :last_name=>"Jones",
				   #:email=>"email333@here.com",
				   :email_priority_id=>email_priorityH.id,
				   :do_not_email=>true,
				   :phone_number=>"987-987-9878" )
	Client.create!(:first_name=>"Jen",
				   :last_name=>"Doe",
				   :email=>"email333@here.com",
				   :email_priority_id=>email_priorityL.id )
				   #:do_not_email=>true,
				   #:phone_number=>"987-987-9878" 
	Client.create!(:first_name=>"Tom",
				   :last_name=>"Jinkins",
				   :email=>"email98777@here.com",
				   :email_priority_id=>email_priorityL.id )
				   #:do_not_email=>true,
				   #:phone_number=>"987-987-9878" 
    
	relationF = Relation.create!(:relation=>"Father")
	relationC = Relation.create!(:relation=>"Child")
	relationS = Relation.create!(:relation=>"Spouse")
	
	 
	SupportClient.create!(:first_name=>"Jim",
	                              :last_name=>"Bo",
								  :phone=>"987-977-9877",
								  :email=>"jim@bo.com",
								  :relation_id=>relationF.id,
								  :client_id=>client1.id)

	SupportClient.create!(:first_name=>"Bill",
								  :last_name=>"Bob",
								  :phone=>"987-97d-9877",
								  :email=>"jim@dddbo.com",
								  :relation_id=>relationC.id,
								  :client_id=>client1.id)
								  
	SupportClient.create!(:first_name=>"Billy",
								  :last_name=>"Bobby",
								  :phone=>"987-97d-9837",
								  :email=>"jim@dddbo.com",
								  :relation_id=>relationS.id,
								  :client_id=>client2.id)

	puppy1=Puppy.create!(:name=>"Puppy1",
						 :gender_id=>genderM.id,
						 :color_id=>colorB.id,
						 :date_sold=>"01/01/2000",
						 :litter_id=>litter1.id,
						 :collar_color_name=>"Blue",
						 :client_id=>client1.id,
						 :notes=> "Notes Here")
	puppy2=Puppy.create!(:name=>"Puppy2",
						 :gender_id=>genderM.id,
						 :color_id=>colorB.id,
						 #:date_sold=>"01/01/2000",
						 :litter_id=>litter1.id,
						 :collar_color_name=>"Green",
						 #:client_id=>,
						 :notes=> "Notes Here")
	puppy3=Puppy.create!(:name=>"Puppy3",
						 :gender_id=>genderM.id,
						 :color_id=>colorB.id,
						 #:date_sold=>"01/01/2000",
						 :litter_id=>litter1.id,
						 :collar_color_name=>"Red",
						 #:client_id=>,
						 :notes=> "Notes Here")
	puppy4=Puppy.create!(:name=>"Puppy4",
						 :gender_id=>genderF.id,
						 :color_id=>colorB.id,
						 :date_sold=>"01/01/2000",
						 :litter_id=>litter1.id,
						 :collar_color_name=>"Purple",
						 :client_id=>client2.id,
						 :notes=> "Notes Here")
	puppy5=Puppy.create!(:name=>"Puppy5",
						 :gender_id=>genderF.id,
						 :color_id=>colorG.id,
						 :date_sold=>"01/01/2000",
						 :litter_id=>litter3.id,
						 :collar_color_name=>"Purple",
						 :client_id=>client1.id,
						 :notes=> "Notes Here")
	puppy6=Puppy.create!(:name=>"Puppy6",
						 :gender_id=>genderF.id,
						 :color_id=>colorG.id,
						 #:date_sold=>"01/01/2000",
						 :litter_id=>litter2.id,
						 :collar_color_name=>"Purple",
						 #:client_id=>,
						 :notes=> "Notes Here")

	Weight.create!(:date=>"01/09/2001",
				   :lb=>1,
				   :oz=>13,
				   :puppy_id=>puppy1.id )
	Weight.create!(:date=>"01/10/2001",
				   :lb=>1,
				   :oz=>14,
				   :puppy_id=>puppy1.id )
	Weight.create!(:date=>"01/11/2001",
				   :lb=>1,
				   :oz=>15,
				   :puppy_id=>puppy1.id )
	Weight.create!(:date=>"01/11/2001",
				   :lb=>1,
				   :oz=>15,
				   :puppy_id=>puppy2.id )
	Weight.create!(:date=>"01/11/2001",
				   :lb=>1,
				   :oz=>16,
				   :puppy_id=>puppy2.id )
	Weight.create!(:date=>"02/20/2002",
				   :lb=>1,
				   :oz=>17,
				   :puppy_id=>puppy2.id )
	Weight.create!(:date=>"01/15/2001",
				   :lb=>1,
				   :oz=>18,
				   :puppy_id=>puppy2.id )
	Weight.create!(:date=>"01/16/2001",
				   :lb=>1,
				   :oz=>19,
				   :puppy_id=>puppy2.id )
	Weight.create!(:date=>"01/11/2001",
				   :lb=>1,
				   :oz=>16,
				   :puppy_id=>puppy5.id )
	Weight.create!(:date=>"02/13/2001",
				   :lb=>1,
				   :oz=>17,
				   :puppy_id=>puppy5.id )
	Weight.create!(:date=>"02/14/2001",
				   :lb=>1,
				   :oz=>18,
				   :puppy_id=>puppy5.id )
	Weight.create!(:date=>"02/16/2001",
				   :lb=>1,
				   :oz=>19,
				   :puppy_id=>puppy5.id )

	Weight.create!(:date=>"02/16/2001",
				   :lb=>1,
				   :oz=>19,
				   :puppy_id=>puppy5.id )


 	expenseTaxType1=ExpenseTaxType.create!(:name=>"Contracting")
	expenseTaxType2=ExpenseTaxType.create!(:name=>"supplies")
	expenseTaxType3=ExpenseTaxType.create!(:name=>"utilities")

	expenseType1=ExpenseType.create!(:name=>"dog food",
									:expense_tax_type_id=>expenseTaxType2.id)
	expenseType2=ExpenseType.create!(:name=>"misc",
									:expense_tax_type_id=>expenseTaxType2.id)
	expenseType3=ExpenseType.create!(:name=>"Vet care",
									:expense_tax_type_id=>expenseTaxType1.id)
	expenseType4=ExpenseType.create!(:name=>"Supplies",
									:expense_tax_type_id=>expenseTaxType2.id)

	expense1=Expense.create!(:name=>"Supplies",
							 :amount=>12.37,
							 :date=>"10/05/2000",
							 :expense_type_id=>expenseType4.id,
							 :litter_id=>litter1.id,
							 :notes=>"notes" )
	expense2=Expense.create!(:name=>"dog shots",
							 :amount=>1122.37,
							 :date=>"10/15/2001",
							 :expense_type_id=>expenseType3.id,
							 :litter_id=>litter1.id,
							 :notes=>"notes" )
	expense3=Expense.create!(:name=>"food",
							 :amount=>312.37,
							 :date=>"05/05/2005",
							 :expense_type_id=>expenseType1.id,
							 #:litter_id=>litter1.id,
							 :notes=>"notes" )
	expense4=Expense.create!(:name=>"more food",
							 :amount=>212.37,
							 :date=>"09/09/2008",
							 :expense_type_id=>expenseType1.id,
							 #:litter_id=>litter1.id,
							 :notes=>"food notes" )

	chargeTypeS=ChargeType.create!(:name=>"Shipping")
	chargeTypeP=ChargeType.create!(:name=>"Puppy")
	chargeTypeM=ChargeType.create!(:name=>"Misc")

	Charge.create!(:date=>"9/2/1980", 
				   :amount=>1999, 
				   :charge_type_id=>chargeTypeP.id, 
				   :puppy_id=>puppy3.id, 
				   :client_id=>client2.id,
				   :notes=>"notes")				   
	Charge.create!(:date=>"9/2/1980", 
				   :amount=>500, 
				   :charge_type_id=>chargeTypeM.id, 
				   :puppy_id=>puppy3.id, 
				   :client_id=>client2.id,
				   :notes=>"Kept the puppy for an extra month")
	Charge.create!(:date=>"9/2/1980", 
				   :amount=>300, 
				   :charge_type_id=>chargeTypeS.id, 
				   :puppy_id=>puppy3.id, 
				   :client_id=>client2.id,
				   :notes=>"Kept the puppy for an extra month")
	Charge.create!(:date=>"9/2/1980", 
				   :amount=>500, 
				   :charge_type_id=>chargeTypeM.id, 
				   #:puppy_id=>puppy1.id, 
				   :client_id=>client1.id,
				   :notes=>"Kept the puppy for an extra month")
	Charge.create!(:date=>"9/2/1980", 
				   :amount=>400, 
				   :charge_type_id=>chargeTypeS.id, 
				   :puppy_id=>puppy1.id, 
				   :client_id=>client1.id )
				   #:notes=>"Kept the puppy for an extra month"
	Charge.create!(:date=>"9/2/1980", 
				   :amount=>1700, 
				   :charge_type_id=>chargeTypeP.id, 
				   :puppy_id=>puppy1.id, 
				   :client_id=>client1.id )
				   #:notes=>"Kept the puppy for an extra month"
	Charge.create!(:date=>"9/2/1980", 
				   :amount=>1700, 
				   :charge_type_id=>chargeTypeP.id, 
				   #:puppy_id=>puppy1.id, 
				   :client_id=>client3.id )

	Payment.create!(:date=>"7/15/2000",
					:amount=>500,
					:client_id=>client1.id,
					:notes=>"deposit")
	Payment.create!(:date=>"9/25/2000",
					:amount=>2000,
					:client_id=>client1.id,
					:notes=>"")
	Payment.create!(:date=>"9/25/2000",
					:amount=>500,
					:client_id=>client2.id,
					:notes=>"deposit")
	Payment.create!(:date=>"10/22/2000",
					:amount=>2200,
					:client_id=>client2.id,
					:notes=>"")
	Payment.create!(:date=>"2/1/2001",
					:amount=>99,
					:client_id=>client2.id,
					:notes=>"")

#	99.times do |n|
#	  name  = Faker::Name.name
#	  email = "example-#{n+1}@railstutorial.org"
#	  password  = "password"
#	  User.create!(:name => name,
#				   :email => email,
#				   :password => password,
#				   :password_confirmation => password)
#	end

#    User.all(:limit => 6).each do |user|
#	  50.times do
#		user.microposts.create!(:content => Faker::Lorem.sentence(5))
#	  end
#	end
	
  end
end