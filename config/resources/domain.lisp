(in-package :mu-cl-resources)

(add-prefix "schema" "http://schema.org/")
(add-prefix "ext" "http://mu.semte.ch/vocabularies/ext/")
(add-prefix "bands" "http://mu.semte.ch/vocabularies/ext/bands/")
(add-prefix "songs" "http://mu.semte.ch/vocabularies/ext/songs/")

;; reading in the domain.json
(read-domain-file "domain.json")

(define-resource band ()
    :class (s-prefix "ext:Band")
    :properties `((:name :string ,(s-prefix "bands:name"))
                  (:description :string ,(s-prefix "bands:description"))
                 )
    :has-many `((song :via ,(s-prefix "ext:Song")
               :as "songs"))
    :resource-base (s-url "http://mu.semte.ch/vocabularies/ext/bands/")
    :on-path "bands"
)

(define-resource song ()
    :class (s-prefix "ext:Song")
    :properties `((:title :string ,(s-prefix "songs:name"))
                  (:rating :integer ,(s-prefix "songs:rating"))
                 )
    :has-one `((band :via ,(s-prefix "ext:Band")
               :as "band"))
    :resource-base (s-url "http://mu.semte.ch/vocabularies/ext/songs/")
    :on-path "songs"
)
