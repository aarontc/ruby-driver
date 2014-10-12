# encoding: utf-8

#--
# Copyright 2013-2014 DataStax, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#++

require File.dirname(__FILE__) + '/../integration_test_case.rb'

class AuthenticationTest < IntegrationTestCase
  def self.before_suite
    super
    @@username, @@password = @@ccm_cluster.enable_authentication
  end

  def self.after_suite
    @@ccm_cluster && @@ccm_cluster.disable_authentication
    super
  end

  def test_can_authenticate_to_cluster
    cluster = Cassandra.cluster(
                username: @@username,
                password: @@password
              )

    refute_nil cluster
  ensure
    cluster.close
  end

  def test_raise_error_on_invalid_auth
    assert_raises(ArgumentError) do
      cluster = Cassandra.cluster(
                  username: '',
                  password: ''
                )
      cluster.close
    end

    assert_raises(Cassandra::Errors::AuthenticationError) do
      cluster = Cassandra.cluster(
                  username: 'invalidname',
                  password: 'badpassword'
                )
      cluster.close
    end

  end
end