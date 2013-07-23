---
layout: post
title:  "Exploring Ruby's tap()"
date:   2013-07-22 12:00:00
categories: ruby method
---

Ruby has a great method named tap(). We can see some simple examples of how this method can benefit in execution of your state machine. 

{% highlight ruby %}
student = Struct.new(:name, :gpa)

class Course

  attr_accessor :students
  attr_accessor :cost

  def initialize(students, cost)
    @students = students
    @cost     = cost
  end 

  def render_bad_kids
    @students.each do |student| 
      student.tap do |attr| 
        attr.gpa < 3.0 ? p(attr.name + "-terrible-student") : p(attr.name)
      end 
    end 
  end 

end

s1 = Student.new("Evil Dave", 2.0)
s2 = Student.new("Nice Jenny", 4.0)

c1 = Course.new([s1, s2], "11,000.00")
p c1.render_bad_kids

#=> "Evil Dave-terrible-student"
#=> "Nice Jenny"
#=> [#<struct Student name="Evil Dave", gpa=2.0>, #<struct Student name="Nice Jenny", gpa=4.0>]
{% endhighlight %}


[bweikulrich-gh]: https://github.com/bweikulrich/bweikulrich
[bweikulrich]:    http://brettu.com
