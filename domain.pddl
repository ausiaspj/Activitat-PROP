(define (domain locks-keys)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent posicio clau)
  (:predicates
    (agent-a ?a - agent ?p - posicio)
    (connectat ?p1 - posicio ?p2 - posicio)
    (porta-tancada ?p - posicio)
    (clau-a ?k - clau ?p - posicio)
    (te-clau ?a - agent ?k - clau)
    (sortida ?p - posicio)
  )

  (:action moure
    :parameters (?a - agent ?p1 - posicio ?p2 - posicio)
    :precondition (and (agent-a ?a ?p1) (connectat ?p1 ?p2) (not (porta-tancada ?p2)))
    :effect (and (not (agent-a ?a ?p1)) (agent-a ?a ?p2))
  )

  (:action recollir
    :parameters (?a - agent ?k - clau ?p - posicio)
    :precondition (and (agent-a ?a ?p) (clau-a ?k ?p))
    :effect (and (te-clau ?a ?k) (not (clau-a ?k ?p)))
  )

  (:action obrir
    :parameters (?a - agent ?padj - posicio ?pdoor - posicio ?k - clau)
    :precondition (and (agent-a ?a ?padj) (connectat ?padj ?pdoor) (porta-tancada ?pdoor) (te-clau ?a ?k))
    :effect (and (not (porta-tancada ?pdoor)))
  )
)
