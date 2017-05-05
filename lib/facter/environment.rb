environments = ['dev', 'uat', 'test-deploy', 'testdeploy', 'staging']

environments_regex = Regexp.union(environments)
if Facter.value(:hostname).match(environments_regex)
    Facter.add('puppet_env') do
        setcode do
            $1
        end
    end
else
    Facter.add('puppet_env') do
        setcode do
            'live'
        end
    end
end
