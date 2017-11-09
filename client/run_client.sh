for i in "$@"
do
case $i in
    --host=*)
    HOST="${i#*=}"
    shift # past argument=value
    ;;
    -m=*|--master=*)
    MASTER="${i#*=}"
    shift # past argument=value
    ;;
    -i=*|--ip=*)
    IP="${i#*=}"
    shift # past argument=value
    ;;
    -t=*|--type=*)
    STREAM_TYPE="${i#*=}"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done
echo "The following parameters will be used to configure ROS network to connect to Dyncam Benchmark Server :"
echo "ROS_HOST       = ${HOST}"
echo "ROS_MASTER_URL = ${MASTER}"
echo "ROS_IP         = ${IP}"
echo "TYPE           = ${STREAM_TYPE}"
if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 $1
fi
