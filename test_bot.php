<?php
ob_start();
require('test_bot.php');
const API_KEY = '5273971957:AAFfOS8A0wN7i4HesFQEPXR0C1qb0kvoaP4';

function bot($method,$datas=[]){
    $url = "https://api.telegram.org/bot".API_KEY."/$method";
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$datas);
    $res = curl_exec($ch);
    if(curl_error($ch)){
        var_dump(curl_error($ch));
    }else{
        return json_decode($res);
    }
}
$update = json_decode(file_get_contents('php://input'));
$data = $update->callback_query->data;
$from_id = $update->callback_query->from->id;
$message = $update->message;
$cid = $message->chat->id;
$mid = $message->message_id;
$text = $message->text;
$name = $message->from->first_name;
$username = $message->from->username;
$user_id = $message->from->id;
$key2 = json_encode([
    'inline_keyboard'=>[
        [['text'=>"Testni boshlash",'callback_data'=>"boshla"]],
    ]
]);
$key = json_encode([
    'resize_keyboard'=>true,
    'one_time_keyboard'=>true,
    'keyboard'=>[
        [['text'=>"💰 Balans"],['text'=>"ℹ️ Bot haqida"]],
        [['text'=>"📈 Reyting"]],
        [['text'=>"☑️Testni boshlash"]]
    ]
]);
$key1 = json_encode([
    'resize_keyboard'=>true,
    'keyboard'=>[
        [['text'=>"Orqaga qaytish"]
        ]]
]);

$channel = 'questauz';

$join = file_get_contents("https://api.telegram.org/bot".API_KEY."/getChatMember?chat_id=@$channel&user_id=".$user_id);


if($text && (strpos($join,'"status":"left"') or strpos($join,'"Bad Request: USER_ID_INVALID"') or strpos($join,'"status":"kicked"'))!== false){
    bot('sendMessage',[
        'chat_id'=>$cid,
        'message_id'=>$mid,
        'parse_mode'=>'markdown',
        'text'=>"

Botdan foydalanish uchun Kanalimizga obuna bo'lishingiz kerak

Kanalimiz
@$channel

Obuna Bo'lgandan sung { /start } Buyurugini Bosing" ,
        'reply_markup'=>json_encode([
            'inline_keyboard'=>[
                [['text'=>"Kanalga azo bo'lish",'url'=>"http://t.me/questauz"]],
            ]
        ])
    ]);return false;}

elseif($text == "/start" or $text == "Orqaga qaytish"){
    $q = "SELECT * FROM `users` where `user_id` = $user_id";
    $r = $conn->query($q);
    $user = $r->fetch();
    if(!$user){
        $stmt = $conn->prepare('INSERT INTO `users` (`name`,`username`,`user_id`,`date`) VALUES (?, ?, ?, ?)');
        $stmt->execute([$name, $username, $user_id, date('Y-m-d H:i:s')]);
        bot('sendMessage',[
            'chat_id' =>333458329,
            'message_id'=>$mid,
            'parse_mode'=>'markdown',
            'text'=>"Yangi foydalanuvchi [$name](tg://user?id=$user_id)",
        ]);
    }
    bot('sendMessage',[
        'chat_id' =>$cid,
        'message_id'=>$mid,
        'parse_mode'=>'markdown',
        'text'=>"Assalomu alekum botimizga hush kelibsiz!",
        'reply_markup'=>$key,
    ]);
}elseif($text =='ℹ️ Bot haqida'){
    bot('sendMessage',[
        'chat_id' =>$cid,
        'message_id'=>$mid,
        'parse_mode'=>'html',
        'text'=>"Assalomu alekum <b>$name</b>
Bu bot @Diyorbek_Tj tomonidan yaratildi!

<b>Yangi Test</b>ni boshlash uchun <b>/start</b> tugmasini bosing.",
        'reply_markup'=> $key1,
    ]);
}
elseif($text == '💰 Balans'){
    $q = "SELECT * FROM `users` where `user_id` = $user_id";
    $r = $conn->query($q);
    $user = $r->fetch();
    bot('sendMessage',[
        'chat_id' =>$cid,
        'message_id'=>$mid,
        'parse_mode'=>'html',
        'text'=>"Assalomu alekum <b>$name</b>
💵Balance: ". $user['balance'].
            "
⬅️Orqaga qaytish /start",
        'reply_markup'=> $key1,
    ]);
}
elseif($text == '☑️Testni boshlash'){

    bot('sendMessage',[
        'chat_id' =>$cid,
        'parse_mode'=>'markdown',
        'text'=>"Kerakli fanni tanlang!",
        'reply_markup'=> json_encode([
            'inline_keyboard'=>[
                [['text'=>"Biologiya",'callback_data'=>"yoq"]],[['text'=>"Geografiya",'callback_data'=>"boshla"]]]
        ])]);


}elseif($text == '📈 Reyting'){
    $q = "SELECT * FROM `users` ORDER BY `balance` DESC LIMIT 5";
    $r = $conn->query($q);
    $user = $r->fetchAll();
    bot('sendMessage',[
        'chat_id' =>$cid,
        'message_id'=>$mid,
        'parse_mode'=>'html',
        'text'=>"Top 5 ta foydalanuvchilar:
1.🥇 <b>".$user[0]['name']."</b>
2.🥈 <b>".$user[1]['name']."</b>
3.🥉 <b>".$user[2]['name']."</b>
4. <b>".$user[3]['name']."</b>
5. <b>".$user[4]['name']."</b>

⬅️Orqaga qaytish /start",
        'reply_markup'=> $key1,]);

}
elseif($data){
    $q = "SELECT * FROM `test_answer` WHERE `user_id` = $from_id ORDER BY `id` desc LIMIT 1";
    $r = $conn->query($q);
    $test1 = $r->fetch();
    if($data == 'boshla')
    {
        $q = "SELECT * FROM `tests` ORDER BY RAND() - 1 LIMIT 1";
        $r = $conn->query($q);
        $test = $r->fetch();
        $stmt = $conn->prepare('INSERT INTO `test_answer` (`user_id`,`answer`,`test_id`) VALUES (?, ?, ?)');
        $stmt->execute([$from_id, $test['answer'], $test['id']]);
        $del = bot('sendPhoto',[
            'chat_id' =>$from_id,
            'parse_mode'=>'markdown',
            'photo' => $test['image'],
            'caption'=>"*". $test['title']."$mid*",
            'reply_markup'=> json_encode([
                'inline_keyboard'=>[
                    [['text'=>$test['A'],'callback_data'=>"A"]],
                    [['text'=>$test['B'],'callback_data'=>"B"]],
                    [['text'=>$test['C'],'callback_data'=>"C"]],
                    [['text'=>$test['D'],'callback_data'=>"D"]],
                    [['text'=>"❌",'callback_data'=>"stop"],['text'=>"➡️",'callback_data'=>"boshla"]]]])
        ])->result->message_id;
        bot('deleteMessage',[
            'chat_id' =>$from_id,
            'message_id'=>$del-1,
        ]);
    }elseif($data =="yoq"){
        bot('sendMessage',[
            'chat_id' =>$from_id,
            'parse_mode'=>'html',
            'text'=>"😔 Afsuski bu fannga oid test topilmadi! 
/start bosing!",
            'reply_markup'=> $key1,
        ]);
    }
    elseif($data == $test1['answer'])
    {
        $q = "UPDATE `users` set `balance` = `balance` + 15, `correct_answers` = `correct_answers` + 0.5 where `user_id`= $from_id";
        $r = $conn->query($q)->execute();
        $del =  bot('sendMessage',[
            'chat_id' =>$from_id,
            'parse_mode'=>'markdown',
            'text'=>"✅ Javobingiz to'g'ri. Balansingizga +30 ball qo'shildi! $mid",
            'reply_markup'=> json_encode([
                'inline_keyboard'=>[
                    [['text'=>"❌",'callback_data'=>"stop"],['text'=>"➡️",'callback_data'=>"boshla"]]]
            ])])->result->message_id;
        bot('deleteMessage',[
            'chat_id' =>$from_id,
            'message_id'=>$del-1,
        ]);

    }
    elseif($data == 'stop')
    {
        bot('deleteMessage',[
            'chat_id' =>$from_id,
            'message_id'=>$del-1,
        ]);
        $del = bot('sendMessage',[
            'chat_id' =>$from_id,
            'parse_mode'=>'markdown',
            'text'=>"Test yechish to'xtatildi",
            'reply_markup'=> $key1,
        ])->result->message_id;
        bot('deleteMessage',[
            'chat_id' =>$from_id,
            'message_id'=>$del-1,
        ]);
    }
    elseif($data != $test1['answer']){
        $del = bot('sendMessage',[
            'chat_id' =>$from_id,
            'parse_mode'=>'markdown',
            'text'=>"😔 Javobingiz hato ",
            'reply_markup'=> json_encode([
                'inline_keyboard'=>[
                    [['text'=>"❌",'callback_data'=>"stop"],['text'=>"➡️",'callback_data'=>"boshla"]]]
            ])])->result->message_id;
        bot('deleteMessage',[
            'chat_id' =>$from_id,
            'message_id'=>$del-1,
        ]);
    }
}else{
    bot('sendMessage',[
        'chat_id' =>$cid,
        'message_id'=>$mid,
        'parse_mode'=>'markdown',
        'text'=>"Buday kommanda topilmadi! /start",
        'reply_markup'=> $key1,
    ]);
}

?>