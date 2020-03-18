# README

# Rails with join table

Run these from a fresh teminal window
```sh
$ rails new results_join_table -T -d postgresql
$ cd results_join_table
$ rails db:create
$ rails g resource Student name:string
$ rails g resource Course title:string
$ rails g resource Result score:integer
```

Your other two migrations shoule be fine, adjust this one to suit.
(check migration files in the folder `db/migrate` )
```rb
class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.belongs_to :student
      t.belongs_to :course
      t.integer :score

      t.timestamps
    end
  end
end
```

And back to terminal
```sh
$ rails db:migrate
$ rails c
```

And then in Rails console
```rb
john = Student.new(name: "john")
john.save
viv = Student.new(name: "viv")
viv.save
wdi = Course.new(title: "WDI")
wdi.save
sei = Course.new(title: "SEI")
sei.save
```

Still in Rails console, note three ways of creating a record
```rb
r = Result.new
r.student = john
r.course = wdi
r.score = 1
r.save

r2 = Result.new( student: viv, course: sei, score: 1)
r2.save

r3 = Result.create(sudent: john, course: sei, score: 0)

Result.count 
=> 3

wdi.students.count 
=> 1
sei.students.count 
=> 2
john.courses.count 
=> 2
viv.courses.count 
=> 1

Course.last.students.map{ |r| r.name } 
=> ["john", "viv"]
sei.results.map{ |r| {name: r.student.name, score: r.score } } 
=> [{:name=>"viv", :score=>1}, {:name=>"john", :score=>0}]

```

Here we have finished setting up a db with 3 models, one of which is a join table with an additional column.
Look in `db/schema.rb`