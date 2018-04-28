def development?
  Rails.env.development?
end

def test?
  Rails.env.test?
end

def production?
  Rails.env.production?
end

def development_or_test?
  development? || test?
end

def development_or_production?
  development? || production?
end
