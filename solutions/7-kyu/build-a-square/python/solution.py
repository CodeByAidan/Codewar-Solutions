def generate_shape(n):
    result_string = ''
    
    for x in range(n):
        result_string += ('+' * n) 
        if (x + 1) != n:
            result_string += '\n'
        
    return result_string