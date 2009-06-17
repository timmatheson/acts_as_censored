module ActsAsCensored
  RESTRICTED_WORDS = %r{(ass|fuck|fucker|fucked|fucking|bitch|slut|whore|cunt|prick|dick|cock|pussy|fagot|nigger|spic|chink|kite|shit|bastard|cum|snatch)}

  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def acts_as_censored(*args, options={})
      bleep_value = options[:with].nil? ? '&%$!@' : options[:with]
      args.each do |column|
        before_save do |record|
          record[column] = record[column].gsub!(RESTRICTED_WORDS,bleep_value)
        end
      end
    end
    
  end
end

class ActiveRecord::Base
  include ActsAsCensored
end