# frozen_string_literal: true

require 'jwt'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class DexEnergy < OmniAuth::Strategies::OAuth2
      option :name, 'dex_energy'

      option :client_options, site: 'https://who.dex.energy', auth_scheme: :basic_auth

      option :authorize_params, scope: 'openid'

      uid do
        raw_info['sub']
      end

      info do
        {
          email: raw_info['email'],
        }
      end

      extra do
        {
          'raw_info' => raw_info,
        }
      end

      private

      def raw_info
        @raw_info ||= extract_raw_info(access_token)
      end

      def issuer_url
        options['client_options']['site']
      end

      def oidc_well_known
        if @well_known.nil?
          uri = URI.parse("#{issuer_url}/.well-known/openid-configuration")
          response = Net::HTTP.get(uri)
          @well_known = JSON.parse(response, symbolize_names: true)
        end

        @well_known
      end

      def algorithms
        oidc_well_known[:id_token_signing_alg_values_supported]
      end

      def jwks
        jwks_uri = oidc_well_known[:jwks_uri]
        uri = URI.parse(jwks_uri)
        response = Net::HTTP.get(uri)
        JSON.parse(response, symbolize_names: true)
      end

      def jwk_loader
        lambda do |options|
          if @cached_keys.nil? || options[:invalidate]
            # we need to load the keys
            @cached_keys = jwks
          end

          @cached_keys
        end
      end

      def extract_raw_info(access_token)
        id_token = access_token.params.fetch('id_token')

        decoded = JWT.decode(id_token, nil, true,
                             algorithms: algorithms,
                             jwks: jwk_loader,
                             verify_aud: true,
                             verify_expiration: true,
                             verify_iat: true,
                             verify_iss: true,
                             verify_jti: true,
                             verify_not_before: true,
                             verify_sub: true)

        decoded.first
      end
    end
  end
end
