require 'app/models/operators/binary'

Dir["#{ROOT}/app/models/operators/*.rb"].each { |file| require file }
Dir["#{ROOT}/app/models/**/*.rb"].each { |file| require file }
