module ActsAsCensored
  RESTRICTED_WORDS = %r{(ass|fuck|fucker|fucked|fucking|bitch|slut|whore|cunt|prick|dick|cock|pussy|fagot|nigger|spic|chink|kite|shit|bastard|cum|snatch)}

  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def acts_as_censored(*args)
      args.each do |column|
        before_create do |record|
          record[column] = record[column].gsub!(RESTRICTED_WORDS,'&%$!@')
        end
      end
    end
    
  end
end

class ActiveRecord::Base
  include ActsAsCensored
end