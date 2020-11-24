
start_hour='2020-11-22 01'
end_hour='2020-11-24-09'

i=0
while [[ ${hour}x != ${end_hour}x ]]
do  
    i=$(( $i + 1 )) 
    echo $i
    if [ $i -eq 100 ];then
        break
    fi
    echo ${start_hour}
    ### transform format
    hour=`date +"%Y-%m-%d-%H" -d "${start_hour}"`
    echo ${hour}
    /home/recsys/platform/hadoop-jd-2.7.3//bin/hadoop fs -put /home/recsys/guofangfang/process_embedding_vec/output_embed_file_binary/${hour}/titleEmbed hdfs://hz-cluster9/user/portal/ODM/RECOMMEND/recsys2_pctr/toutiao/emb_nn_binary/${hour}
    start_hour=`date -d " 1 hour ${start_hour}" +"%Y-%m-%d %H"`
done
    
