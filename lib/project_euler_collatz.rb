def even_next(n)
    n/2
end

def odd_next(n)
    3 * n + 1
end

def next_value(n)
    if n.odd?
        odd_next(n)
    else
        even_next(n)
    end
end

def collatz(n)
    result = [n]
    while n != 1
        n = next_value(n)
        result.push(n)
    end
    result
end

def collatzLength(n, cache)
    length = 1
    i = n
    while n != 1 && n >= i
        n = next_value(n)
        length += 1
    end
    length + cache[n]
end

def longest_collatz
    maxLength = 0
    maxLengthNumber = 0
    cache = [1, 1]
    (1..999999).each do |i|
        length = collatzLength(i, cache)
        cache[i] = length
        if length > maxLength
            maxLength = length
            maxLengthNumber = i
        end
    end
    maxLengthNumber
end