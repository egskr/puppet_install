Facter.add(:definition) do
  setcode do
    Facter.value(:fqdn) == 'master.minsk.epam.com'
  end
end
