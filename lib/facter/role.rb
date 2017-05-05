roles = [
    /(cjo)(?:[0-9]|[-])/i,
    /(stahl)(?:[0-9]|[-])/i
]

roles_regex = Regexp.union(roles)
if Facter.value(:hostname).match(roles_regex)
    Facter.add('puppet_role') do
        setcode do
            $1
        end
    end
end
