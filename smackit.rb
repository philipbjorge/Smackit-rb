class Object
  attr_accessor :smackit_recreate

  def smackit
    # The cool thing about smackit is that we return a new object, but it (appears)
    # to reuse the same closure we created when the object was first instantiated.
    @smackit_recreate.call
  end
end

class Class
  alias oldNew  new
  
  def new(*args)
    # Save a closure of the construction function on our new object.
    # This will be called whenever we smackit to get to our original state.
    orig_obj = oldNew(*args)
    orig_obj.smackit_recreate = lambda { new(*args) }
    orig_obj
  end
end
