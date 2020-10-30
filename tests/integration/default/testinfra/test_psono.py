def test_file_exists(host):
    psono = host.file('/psono.yml')
    assert psono.exists
    assert psono.contains('your')

# def test_psono_is_installed(host):
#     psono = host.package('psono')
#     assert psono.is_installed
#
#
# def test_user_and_group_exist(host):
#     user = host.user('psono')
#     assert user.group == 'psono'
#     assert user.home == '/var/lib/psono'
#
#
# def test_service_is_running_and_enabled(host):
#     psono = host.service('psono')
#     assert psono.is_enabled
#     assert psono.is_running
