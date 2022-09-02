local kata = {}

function kata.multiply(a, b)
  local Result = 0
  local Success,Error = pcall(function()
      assert(a,"Failed")
      assert(b,"Failed")
      
      if type(a) == "number" and type(b) == "number" then
        Result = a * b
    else
        error("Failed to get correct data.")
      end
  end)
  
  if Success then
    return Result
    
else
    warn("Failed!")
    if Error then
      warn(Error)
    end
  end
  
end

kata[1] = kata.multiply(10,10)

return kata