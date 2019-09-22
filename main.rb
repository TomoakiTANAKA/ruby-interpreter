require 'minruby'

def evaluate(tree)
  return tree[1] if tree[0] == 'lit'

  case tree[0]
  when '+'
    evaluate(tree[1]) + evaluate(tree[2])
  when '-'
    evaluate(tree[1]) - evaluate(tree[2])
  when '*'
    evaluate(tree[1]) * evaluate(tree[2])
  when '/'
    evaluate(tree[1]) / evaluate(tree[2])
  when '%'
    evaluate(tree[1]) % evaluate(tree[2])
  when '**'
    evaluate(tree[1]) ** evaluate(tree[2])
  when '=='
    evaluate(tree[1]) == evaluate(tree[2])
  when '!='
    evaluate(tree[1]) != evaluate(tree[2])
  when '<'
    evaluate(tree[1]) < evaluate(tree[2])
  when '<='
    evaluate(tree[1]) <= evaluate(tree[2])
  when '>'
    evaluate(tree[1]) > evaluate(tree[2])
  when '>='
    evaluate(tree[1]) >= evaluate(tree[2])
  else
    raise "サポートされていない演算子 #{tree[0]} が入力されました"
  end
end

def max(tree)
  return tree[1] if tree[0] == 'lit'

  if max(tree[1]) > max(tree[2])
    max(tree[1])
  else
    max(tree[2])
  end
end

if __FILE__ == $0
  tree = minruby_parse('2 + 5 + 4')

  answer = max(tree)
  p answer
end
