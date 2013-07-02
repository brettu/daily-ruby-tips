# Rails 4 ActiveRecord has a feature called references(). 
# This allows us a better API for creating and 
# interfacing with joins in ActiveRecord. 
# It should be noted this the new default 
# we won't see deprecation warnings anymore if references are not used 

def test_eager_with_has_many_and_limit_and_conditions_array_on_the_eagers
  # Rails 3.2
  posts = Post.all.merge!(
    :includes => [ :author, :comments ], 
    :limit => 2, :where => [ "authors.name = ?", 'David' ]
  ).to_a

  # Rails 4+
  posts = Post.includes(:author, :comments).limit(2).references(:author).where("authors.name = ?", 'David')
  assert_equal 2, posts.size

end

# This is a more concise way to write the request.
# Another great part is the migration name parsing for the relation.
## $ rails generate migration AddCourseRefToUsers course:references

# this command returns
class AddCourseRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :course, index: true
  end
end

# Indexes are created and the relation is setup. 
