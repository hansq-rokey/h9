/**
 * Created by Administrator on 2015/9/20.
 */
var videos = new Array('��Ƶ1', '��Ƶ2', '��Ƶ3');
var timeline = new Array(0);    // ��¼����ʱ��
var nowVideoLocation = 0;   // Ŀǰ���ڵ�λ��
var playerNum = 0; // Ŀǰʹ�õ�video��ǩλ��
var str;        // �����Ϣ
var totalTime = 0;      // ��Ƶ��ʱ��
var currentVideoTime = 0;
var i = 0;  // ��ʼ��������
var targetTime = 0; // Ŀ��ʱ��
var targetPlayer = 0;   // ��¼Ŀ�겥����
var loadNextSource = false; // �Ƿ��Ѿ�����һ��urlд��src
$('document').ready(function() {
    initTimeline();     // ���г�ʼ������
    // $('.video:eq(' + playerNum + ')').attr('src', videos[i]);
    /*          setInterval(function(){
     str = $('#video-meta').html();
     $('#video-meta').html(str + 'Ŀǰʱ��')
     }, 100)
     */
    /*          $('.video')[playerNum].addEventListener('');
     */
    $('#btn-play').click(function() {
        if ($('.video')[playerNum].paused)
            $('.video')[playerNum].play();
        else
            $('.video')[playerNum].pause();
    });
    $('#set-time').click(function() {
        setToTime($('#time').val());
    })
});
function initHandler() {
    timeline[i] = $('.video') [1].duration;
    totalTime += timeline[i];
    if (i < videos.length - 1) {
        $('.video')[1].src = videos[++i]
    } else {
        $('.video')[1].src = '';
        $('.video')[1].removeEventListener('loadedmetadata', initHandler, true);
    }
}
function currentTimeHandler() {
    currentVideoTime = $('.video')[playerNum].currentTime;
    if (timeline[nowVideoLocation] - currentVideoTime < 20 && !loadNextSource) {
        loadNextVideo(nowVideoLocation + 1);
        loadNextSource = true;
    }
}
function initTimeline () {
    $('.video')[1].preload = 'auto';
    $('.video')[1].src = videos[i];
    $('.video')[0].src = videos[i];
    $('.video')[1].addEventListener('loadedmetadata', initHandler, true);
    $('.video')[0].addEventListener('timeupdate', currentTimeHandler, true);
    $('.video')[0].addEventListener('ended', switchNextVideo, true);
}
function loadNextVideo(nextLocation) {
    var nextPlayer = Number(!playerNum);
    if (nextLocation < videos.length) {
        $('.video')[nextPlayer].preload = 'auto';
        $('.video')[nextPlayer].src = videos[nextLocation];
    }
}
function setToTime(time) {
    var videoChapter;
    var nextPlayer = Number(!playerNum);
    if (time >= totalTime) {
        videoChapter = videos.length - 1;
        time = totalTime;
    } else {
        for (videoChapter = 0; videoChapter < videos.length - 1; videoChapter++) {
            if (time - timeline[videoChapter] < 0) {
                break;
            } else {
                time -= timeline[videoChapter];
            }
        }
    }
    if (videoChapter == nowVideoLocation) {
        $('.video')[playerNum].currentTime = time;
    } else {
        loadNextVideo(videoChapter);
        targetTime = time;
        /*$('.video')[nextPlayer].currentTime = time;*/
        targetPlayer = nextPlayer;
        $('.video')[targetPlayer].addEventListener('durationchange', jumpToTime, true);
        switchToVideo();
        nowVideoLocation = videoChapter;
    }
}
function jumpToTime() {
    $('.video')[targetPlayer].currentTime = targetTime;
    $('.video')[targetPlayer].removeEventListener('durationchange', jumpToTime, true);
}
function switchNextVideo() {
    var nextPlayer = Number(!playerNum);
    loadNextSource = false;
    if (nowVideoLocation < videos.length - 1) {
        $('.video:eq(' + nextPlayer + ')').css('display', '');
        $('.video:eq(' + playerNum + ')').css('display', 'none');
        $('.video')[playerNum].pause();
        $('.video')[playerNum].removeEventListener('timeupdate', currentTimeHandler, true);
        $('.video')[playerNum].removeEventListener('ended', switchNextVideo, true);
        $('.video')[playerNum].src = '';
        $('.video')[nextPlayer].addEventListener('timeupdate', currentTimeHandler, true);
        $('.video')[nextPlayer].addEventListener('ended', switchNextVideo, true);
        $('.video')[nextPlayer].play();
        nowVideoLocation++;
        playerNum = nextPlayer;
    } else {
        $('.video')[playerNum].removeEventListener('ended', switchNextVideo, true);
    }
}
function switchToVideo() {
    var nextPlayer = Number(!playerNum);
    loadNextSource = false;
    $('.video:eq(' + nextPlayer + ')').css('display', '');
    $('.video:eq(' + playerNum + ')').css('display', 'none');
    $('.video')[playerNum].pause();
    $('.video')[playerNum].removeEventListener('timeupdate', currentTimeHandler, true);
    $('.video')[playerNum].removeEventListener('ended', switchToVideo, true);
    $('.video')[playerNum].src = '';
    $('.video')[nextPlayer].addEventListener('timeupdate', currentTimeHandler, true);
    $('.video')[nextPlayer].addEventListener('ended', switchToVideo, true);
    $('.video')[nextPlayer].play();
}