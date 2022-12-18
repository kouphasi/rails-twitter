window.onload = async function(){
    const button = document.getElementById("goodButton")
    const user_id = Number(document.getElementById("user_id").value)
    const tweet_id = Number(document.getElementById("tweet_id").value)

    
    const isGood = async function(){
        const res = await fetch("/api/good/"+user_id+"/isgood/"+tweet_id)
        const data = await res.json()
        if (data.status){
            button.textContent = "♥"
            button.style = "background: pink"
        }else {
            button.style = "backgroud: white"
            button.textContent = "♡"
            
        }
    }
    
    const good = async function(){
        const res = await fetch("/api/good/"+user_id+"/good/"+tweet_id)
        const data = await res.json()
        
        if(data.status){
            button.style = "background: pink"
            button.textContent = "♥"
        }
        
    }
    const bad = async function(){
        const res = await fetch("/api/good/"+user_id+"/bad/"+tweet_id)
        const data = await res.json()
        if(data.status){
            button.style = "background: white"
            button.textContent = "♡"
        }
    }
    isGood()
    button.onclick= async function(){
        if (button.textContent ==="♡"){
            good()
        }else{
            bad()
        }
    }
}