#!/bin/bash
echo "パスワードマネージャーへようこそ！"
#!/bin/bash

file="pass.txt"

while true; do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read choice

    case $choice in
        "Add Password")
            echo "サービス名を入力してください："
            read  service_name
            echo "ユーザー名を入力してください："
            read  user_name
            echo "パスワードを入力してください："
            read  pass
            echo "パスワードの追加は成功しました。"
            echo "$service_name:$user_name:$pass" >> $file
            ;;
        "Get Password")
            echo "サービス名を入力してください："
            read service_name
            matched_line=$(grep "^$service_name:" "$file")

            if [ -n "$matched_line" ]; then
                IFS=":" read -r found_service_name found_id found_password <<< "$matched_line"

                echo "サービス名: $found_service_name"
                echo "ユーザー名: $found_id"
                echo "パスワード: $found_password"
            else
                echo "Service name not found."
            fi

            ;;
        Exit)
            echo "Thank you!"
            break
            ;;
        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
done

