# #!/usr/bin/env bash


# DOCKER_BUILDKIT=1 docker-compose up


# while :; do
#     case $1 in
#         --exposeip)
# 	   ;;
#         #################################################
#         # Disable color
#         #################################################
#         --no-ansi)
#             DOCKER_COMPOSE_EXTRA_OPTS+=" --no-ansi"
#             ;;
#         --force-pull)
#             export FORCEPULL="true"
#             printf $COLOR_Y'Pulling the latest revision of the used Docker images...\n\n'$COLOR_RESET
#             ;;
#         #################################################
#         # Exclude switches
#         #################################################
#         --no-provider)
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${COMPOSE_DIR}\/provider.yml/}"
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${COMPOSE_DIR}\/redis.yml/}"
            
#             printf $COLOR_Y'Starting without Provider...\n\n'$COLOR_RESET
#             ;;
#         --with-registry)
#             COMPOSE_FILES+=" -f ${COMPOSE_DIR}/registry.yml"
#             printf $COLOR_Y'Starting with Registry...\n\n'$COLOR_RESET
#             ;;
#         --with-c2d)
#             COMPOSE_FILES+=" -f ${DIR}/ipfs/ipfs.yml"
#             COMPOSE_FILES+=" -f ${COMPOSE_DIR}/registry.yml"
#             COMPOSE_FILES+=" -f ${COMPOSE_DIR}/c2d.yml"

#             printf $COLOR_Y'Starting with C2D...\n\n'$COLOR_RESET
#             ;;
#         --with-rbac)
# 	        COMPOSE_FILES+=" -f ${COMPOSE_DIR}/rbac.yml"
#             printf $COLOR_Y'Starting with RBAC Server...\n\n'$COLOR_RESET
#             ;;

#         --with-backend)
# 	        COMPOSE_FILES+=" -f ${BACKEND_DIR}/backend.yml"
#             printf $COLOR_Y'Starting with RBAC Server...\n\n'$COLOR_RESET
#             ;;
#         --no-backend)
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${BACKEND_DIR}\/backend.yml/}"
# 	        printf $COLOR_Y'Starting without BACKEND...\n\n'$COLOR_RESET
#             ;;

#         --with-frontend)
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${DIR}\/frontend/docker-compose.yml/}"
# 	        printf $COLOR_Y'Starting with Frontend...\n\n'$COLOR_RESET
#             ;;
#         --no-ipfs)
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${DIR}\/ipfs/ipfs.yml/}"
# 	        printf $COLOR_Y'Starting without IPFS...\n\n'$COLOR_RESET
#             ;;
#         --with-thegraph)
#             COMPOSE_FILES+=" -f ${COMPOSE_DIR}/thegraph.yml"
#             printf $COLOR_Y'Starting with TheGraph...\n\n'$COLOR_RESET
#             ;;
#         --no-aquarius)
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${COMPOSE_DIR}\/aquarius.yml/}"
#             printf $COLOR_Y'Starting without Aquarius...\n\n'$COLOR_RESET
#             ;;
#         --no-elasticsearch)
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${COMPOSE_DIR}\/elasticsearch.yml/}"
#             printf $COLOR_Y'Starting without Elastic search...\n\n'$COLOR_RESET
#             ;;
#         --no-dashboard)
#             COMPOSE_FILES="${COMPOSE_FILES/ -f ${COMPOSE_DIR}\/dashboard.yml/}"
#             printf $COLOR_Y'Starting without Dashboard ...\n\n'$COLOR_RESET
#             ;;
#         --skip-deploy)
#             export DEPLOY_CONTRACTS=false
#             printf $COLOR_Y'Ocean contracts will not be deployed, the last deployment (if any) will be intact ...\n\n'$COLOR_RESET
#             ;;
#         --skip-subgraph-deploy)
#             export DEPLOY_SUBGRAPH=false
#             printf $COLOR_Y'Ocean subgraph will not be deployed, the last deployment (if any) will be intact ...\n\n'$COLOR_RESET
#             ;;
#         #################################################
#         # Cleaning switches
#         #################################################
#         --purge)
#             printf "$COMPOSE_FILES"
#             printf $COLOR_R'Doing a deep clean ...\n\n'$COLOR_RESET
#             eval docker-compose --project-name=$PROJECT_NAME "$COMPOSE_FILES" down;
#             docker network rm ${PROJECT_NAME}_default || true;
#             docker network rm ${PROJECT_NAME}_backend || true;
#             shift
#             break
#             ;;

#         --restart)
#             printf "$COMPOSE_FILES"
#             printf $COLOR_R'Doing a deep clean ...\n\n'$COLOR_RESET
#             eval docker-compose --project-name=$PROJECT_NAME "$COMPOSE_FILES" down;
#             docker network rm ${PROJECT_NAME}_default || true;
#             docker network rm ${PROJECT_NAME}_backend || true;

#             [ ${CHECK_ELASTIC_VM_COUNT} = "true" ] && check_max_map_count
#             printf $COLOR_Y'Starting Ocean V4...\n\n'$COLOR_RESET
#             [ ${DEPLOY_CONTRACTS} = "true" ] && clean_local_contracts
#             [ ${FORCEPULL} = "true" ] && eval docker-compose "$DOCKER_COMPOSE_EXTRA_OPTS" --project-name=$PROJECT_NAME "$COMPOSE_FILES" pull
#             [ ${FORCEPULL} = "true" ] && eval docker-compose "$DOCKER_COMPOSE_EXTRA_OPTS" --project-name=$PROJECT_NAME "$COMPOSE_FILES" build
            
#             eval docker-compose "$DOCKER_COMPOSE_EXTRA_OPTS" --project-name=$PROJECT_NAME "$COMPOSE_FILES" up --remove-orphans -d
           
           
#             break
#             ;;

#         --backend)
#             printf $COLOR_R'Doing a deep clean ...\n\n'$COLOR_RESET

#             export COMPOSE_FILES=" -f ${BACKEND_DIR}/backend.yml -f ${COMPOSE_DIR}/network_volumes.yml"          
#             eval docker-compose "$DOCKER_COMPOSE_EXTRA_OPTS" --project-name=$PROJECT_NAME "$COMPOSE_FILES" up --remove-orphans -d
#             shift
#             break
#             ;;

#         --down)
#             printf $COLOR_R'Doing a deep clean ...\n\n'$COLOR_RESET

#             export COMPOSE_FILES=" -f ${BACKEND_DIR}/backend.yml -f ${COMPOSE_DIR}/network_volumes.yml"          
#             eval docker-compose "$DOCKER_COMPOSE_EXTRA_OPTS" --project-name=$PROJECT_NAME "$COMPOSE_FILES" down
#             eval docker-compose "$DOCKER_COMPOSE_EXTRA_OPTS" --project-name=$PROJECT_NAME "$COMPOSE_FILES" up --remove-orphans -d
#             shift
#             break
#             ;;
#         --) # End of all options.
#             shift
#             break
#             ;;
#         -?*)
#             printf $COLOR_R'WARN: Unknown option (ignored): %s\n'$COLOR_RESET "$1" >&2
#             break
#             ;;
#         *)

#             break
#     esac
#     shift
# done
