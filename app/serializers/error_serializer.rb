module ErrorSerializer
  def self.serialize(errors)
    return if errors.nil?

    json = {}

    hash = errors.to_hash.map do |key, value|
      value.map do |msg|
        { id: key, title: msg }
      end
    end.flatten

    json[:errors] = hash
    json
  end
end
