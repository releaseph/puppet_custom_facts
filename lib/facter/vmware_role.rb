if Facter.value(:virtual) == 'vmware'
    roles = 'cjo|stahl'
    if Facter.value(:hostname).match(/(#{roles})(?:[0-9]|[-])/i)
        Facter.add('puppet_role') do
            setcode do
                $1
            end
        end
    end
end
