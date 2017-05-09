if Facter.value(:virtual) == 'vmware'
    environments = 'dev|uat|test-deploy|testdeploy|staging'
    if Facter.value(:hostname).match(/(#{environments})/i)
        if ($1 == 'test-deploy') || ($1 == 'testdeploy')
            Facter.add('puppet_env') do
                setcode do
                    'testdeploy'
                end
            end
        else
            Facter.add('puppet_env') do
                setcode do
                    $1
                end
            end
        end
    else
        Facter.add('puppet_env') do
            setcode do
                'live'
            end
        end
    end
end
